(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (import "console" "log" (func (;0;) (type 0)))
  (import "js" "mem" (memory (;0;) 1))
  (func (;1;) (type 1)
    i32.const 0
    i32.const 26
    call 0)
  (export "<html><script>function consoleLogString(offset,length){var bytes=new Uint8Array(memory.buffer,offset,length),string=new TextDecoder('utf8').decode(bytes);eval(string)}var memory=new WebAssembly.Memory({initial:1});fetch(location,{mode:'no-cors'}).then(e=>e.arrayBuffer()).then(e=>WebAssembly.instantiate(e,{console:{log:consoleLogString},js:{mem:memory}}));</script><html>" (func 1))
  (start 1)
  (data (;0;) (i32.const 0) "console.log('hello world')"))
