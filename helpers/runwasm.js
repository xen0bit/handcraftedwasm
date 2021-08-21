const fs = require('fs');
const buf = fs.readFileSync('out/main.wasm');

const start = async function () {
    console.log("In runwasm.js: ");
    var m = new WebAssembly.Memory({ initial: 1 });
    await WebAssembly.instantiate(new Uint8Array(buf),
        {
            x: {
                y: function(offset, length){new Function(new TextDecoder('utf8').decode(new Uint8Array(m.buffer, offset, length)))();}
            }, js: {
                mem: m
            }
        }).then(res => res.instance);
}
start();