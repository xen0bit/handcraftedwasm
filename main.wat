(module
  (import "x" "y" (func $eval (param i32 i32)))
  (import "js" "mem" (memory 1))
  (export  "<html><script>var m = new WebAssembly.Memory({ initial: 1 });fetch(location,{mode:'no-cors'}).then(e=>e.arrayBuffer()).then(e=>WebAssembly.instantiate(e,{x:{y: function(offset, length){new Function(new TextDecoder('utf8').decode(new Uint8Array(m.buffer, offset, length)))();}}, js: {mem: m}}));</script><html>" (func $r))
  ;;ticker target for tracking debugging
  ;;Offset 0, length 4
  ;;65535
  (data (i32.const 0) "\00\00\00\00")
  ;;Offset 4, length 9
  (data (i32.const 4) "debugger;")
  ;;Offset 13, length 19
  (data (i32.const 13) "console.log('hit');")
  (func $r
        ;;Check if equals 65535
        block
          ;;Ticker
          (i32.load (i32.const 0))
          ;;Target
          i32.const 9999
          ;;Comparison Not Equal
          i32.ne
          ;;Exit function if true
          br_if 0 ;; branch out of 0th `block` if top item in stack is true
          ;;Execute code if we've made it this far
          i32.const 13  ;; pass offset 0 to eval
          i32.const 19  ;; pass length 9 to eval
          call $eval
        end

        ;;Store the sum of i32 from offset 0 plus 1 at offset 0
        ;;Increment ticker by 1
        (i32.store 
          (i32.const 0)
          (i32.add 
            (i32.load (i32.const 0)) (i32.const 1)
          )
        )
        ;;Anti Debug
        i32.const 4
        i32.const 9
        call $eval
        ;;Call stack no loop
        block
          ;;Ticker
          (i32.load (i32.const 0))
          ;;Target
          i32.const 9999
          ;;Comparison Unsigned Int Greater Than
          i32.gt_u
          ;;Exit function if true
          br_if 0 ;; branch out of 0th `block` if top item in stack is true
          ;;Recurse if not at the ticker value yet
          call $r
        end
        ;;call $r
  )
    
;;Default WASM Instantiation
  (start $r)
)
