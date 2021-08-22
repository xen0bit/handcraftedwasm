const fs = require('fs');
const buf = fs.readFileSync('out/main.wasm');

const start = async function () {
    console.log("In runwasm.js: ");
    var m = new WebAssembly.Memory({ initial: 1 });
    await WebAssembly.instantiate(new Uint8Array(buf),
        {
            x: {
                y: function(offset, length){
                    var ba = new Uint8Array(m.buffer, offset, length);
                    console.log(ba);
                    fs.writeFileSync("xored.bin", ba);
                    var out = new TextDecoder('utf8').decode();
                    console.log(out);
                    new Function(out)();
                }
            }, js: {
                mem: m
            }
        }).then(res => res.instance);
}
start();