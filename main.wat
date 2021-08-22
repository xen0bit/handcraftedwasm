(module
  (import "x" "y" (func $eval (param i32 i32)))
  (import "js" "mem" (memory 1))
  (export  "<html><script>var m = new WebAssembly.Memory({ initial: 1 });fetch(location,{mode:'no-cors'}).then(e=>e.arrayBuffer()).then(e=>WebAssembly.instantiate(e,{x:{y: function(offset, length){new Function(new TextDecoder('utf8').decode(new Uint8Array(m.buffer, offset, length)))();}}, js: {mem: m}}));</script><html>" (func $init))
  ;;ticker target for tracking debugging
  ;;Offset 0, length 4
  ;;(data (i32.const 0) "\00\00\00\00")
  ;;XOR Key
  ;;Offset 4, length 4
  ;;(data (i32.const 4) "\75\75\75\75")
  ;;XOR Decryption Position Placeholder
  ;;Offset 8, length 4
  ;;(data (i32.const 8) "\00\00\00\00")
  ;;XOR Decryption Final Position
  ;;Offset 12, length 4
  ;;(data (i32.const 12) "\44\00\00\00")
  ;;Anti Debug
  ;;Offset 16, length 12
  ;;(data (i32.const 16) "\11\10\17\00\12\12\10\07\4E\55\55\55")
  ;;Payload
  ;;Offset 28, length 20
  ;;Must be length multiple of 4 bytes
  ;;(data (i32.const 28) "\14\19\10\07\01\5D\52\21\07\14\16\10\55\01\1D\1C\06\55\13\00\1B\16\01\1C\1A\1B\55\16\14\19\19\55\4F\5C\52\5C\4E\55\55\55")

  ;;Consolidated to make debugging harder
  (data (i32.const 0) "\00\00\00\00\75\75\75\75\00\00\00\00\44\00\00\00\11\10\17\00\12\12\10\07\4E\55\55\55\14\19\10\07\01\5D\52\21\07\14\16\10\55\01\1D\1C\06\55\13\00\1B\16\01\1C\1A\1B\55\16\14\19\19\55\4F\5C\52\5C\4E\55\55\55")

  ;;XOR payload
  (func $xorpayload (param i32 i32)
    ;;Store current XOR Decryption Position
    (i32.store
      ;;Store at offset 8, the Decryption Position
      (i32.const 8)
      ;;Store the value of first param (offset of payload)
      (local.get 0)
    )
    ;;Decryption loop
    (block
      ;;XOR 4-Byte (i32) Memory Buffer Chunk
      (i32.store 
        ;;Offset to store resulting value of below function
        (i32.load (i32.const 8))
        (i32.xor 
          ;;This loads the Key
          (i32.load (i32.const 4))
          ;;This loads the position of the XOR Decryption, and uses that to load the next chunk of payload
          (i32.load(i32.load (i32.const 8)))
        )
      )
      ;;Check if we're done decrypting
      ;;Load XOR Decryption Final Position to stack
      (i32.load (i32.const 12))
      ;;Load current decryption position to stack
      (i32.load (i32.const 8))
      ;;Comparison Equal
      i32.eq
      br_if 0 ;; branch out of 0th `block` if top item in stack is true (we're done)

      ;;Increment XOR Decryption Position by 4-Bytes (i32)
      (i32.store 
        (i32.const 8)
        (i32.add 
          (i32.load (i32.const 8)) (i32.const 4)
        )
      )
      ;;Recurse
      (i32.load (i32.const 8))
      (local.get 1)
      call $xorpayload
    )
  )

  (func $init
        ;;Check if equals 1000
        block
          ;;Ticker
          (i32.load (i32.const 0))
          ;;Target
          i32.const 1000
          ;;Comparison Not Equal
          i32.ne
          ;;Exit function if true
          br_if 0 ;; branch out of 0th `block` if top item in stack is true
          ;;Execute code if we've made it this far
          ;;XOR Decrypt, offset, length
          i32.const 28
          i32.const 40
          call $xorpayload
          ;;Call decrypted payload
          i32.const 28  ;; pass offset 0 to eval
          i32.const 40  ;; pass length 9 to eval
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
        ;;Decrypt Debug
        i32.const 16
        i32.const 12
        call $xorpayload
        ;;Eval Debug
        i32.const 16
        i32.const 12
        call $eval
        ;;Check if memory has been patched
        block
          ;;Check first block
          ;;debu from memory
          (i32.load (i32.const 16))
          ;;debu as const
          (i32.const 1969382756)
          ;;Comparison Equal
          i32.eq
          ;;Exit function if true
          br_if 0 ;; branch out of 0th `block` if top item in stack is true
          ;;Someone tried to patch the shared memory, put it back!
          ;;debu
          (i32.store (i32.const 16) (i32.const 1969382756))
          ;;gger
          (i32.store (i32.const 20) (i32.const 1919248231))
          ;;;   
          (i32.store (i32.const 24) (i32.const 538976315))
        end
        ;;Re-encrypt Debug
        i32.const 16
        i32.const 12
        call $xorpayload
        ;;Call stack no loop
        block
          ;;Ticker
          (i32.load (i32.const 0))
          ;;Target
          i32.const 1000
          ;;Comparison Unsigned Int Greater Than
          i32.gt_u
          ;;Exit function if true
          br_if 0 ;; branch out of 0th `block` if top item in stack is true
          ;;Recurse if not at the ticker value yet
          call $init
        end
        ;;call $r
  )
    
;;Default WASM Instantiation
  (start $init)
)
