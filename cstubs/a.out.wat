(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (type (;2;) (func (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i64 i32) (result i64)))
  (import "wasi_snapshot_preview1" "proc_exit" (func (;0;) (type 0)))
  (func (;1;) (type 1)
    call 11)
  (func (;2;) (type 2) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 0
    i32.const 16
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    i32.const 0
    local.set 3
    local.get 2
    local.get 3
    i32.store offset=12
    i32.const 6
    local.set 4
    local.get 2
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    i32.const 4
    local.set 7
    local.get 6
    local.get 7
    i32.add
    local.set 8
    i32.const 0
    local.set 9
    local.get 9
    i32.load16_u offset=1028 align=1
    local.set 10
    local.get 8
    local.get 10
    i32.store16 align=1
    local.get 9
    i32.load offset=1024 align=1
    local.set 11
    local.get 6
    local.get 11
    i32.store align=1
    i32.const 6
    local.set 12
    local.get 2
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.set 14
    local.get 14
    return)
  (func (;3;) (type 1)
    block  ;; label = @1
      i32.const 1
      i32.eqz
      br_if 0 (;@1;)
      call 1
    end
    call 2
    call 6
    unreachable)
  (func (;4;) (type 0) (param i32)
    local.get 0
    call 0
    unreachable)
  (func (;5;) (type 1)
    (local i32)
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      i32.const 0
      i32.le_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        local.tee 0
        i32.load
        call_indirect (type 1)
        local.get 0
        i32.const 0
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    call 7)
  (func (;6;) (type 0) (param i32)
    call 7
    call 5
    call 7
    local.get 0
    call 4
    unreachable)
  (func (;7;) (type 1))
  (func (;8;) (type 2) (result i32)
    global.get 0)
  (func (;9;) (type 0) (param i32)
    local.get 0
    global.set 0)
  (func (;10;) (type 3) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set 0
    local.get 1)
  (func (;11;) (type 1)
    i32.const 5243936
    global.set 2
    i32.const 1052
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 1)
  (func (;12;) (type 2) (result i32)
    global.get 0
    global.get 1
    i32.sub)
  (func (;13;) (type 2) (result i32)
    global.get 1)
  (func (;14;) (type 3) (param i32) (result i32)
    i32.const 1)
  (func (;15;) (type 0) (param i32))
  (func (;16;) (type 0) (param i32))
  (func (;17;) (type 0) (param i32))
  (func (;18;) (type 2) (result i32)
    i32.const 1032
    call 16
    i32.const 1040)
  (func (;19;) (type 1)
    i32.const 1032
    call 17)
  (func (;20;) (type 3) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 0
          i32.load offset=76
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 0
          call 21
          return
        end
        local.get 0
        call 14
        local.set 1
        local.get 0
        call 21
        local.set 2
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        call 15
        local.get 2
        return
      end
      i32.const 0
      local.set 2
      block  ;; label = @2
        i32.const 0
        i32.load offset=1044
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=1044
        call 20
        local.set 2
      end
      block  ;; label = @2
        call 18
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          i32.const 0
          local.set 1
          block  ;; label = @4
            local.get 0
            i32.load offset=76
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 0
            call 14
            local.set 1
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.get 0
            i32.load offset=28
            i32.le_u
            br_if 0 (;@4;)
            local.get 0
            call 21
            local.get 2
            i32.or
            local.set 2
          end
          block  ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            call 15
          end
          local.get 0
          i32.load offset=56
          local.tee 0
          br_if 0 (;@3;)
        end
      end
      call 19
    end
    local.get 2)
  (func (;21;) (type 3) (param i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=20
      local.get 0
      i32.load offset=28
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.const 0
      local.get 0
      i32.load offset=36
      call_indirect (type 4)
      drop
      local.get 0
      i32.load offset=20
      br_if 0 (;@1;)
      i32.const -1
      return
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i64.extend_i32_s
      i32.const 1
      local.get 0
      i32.load offset=40
      call_indirect (type 5)
      drop
    end
    local.get 0
    i32.const 0
    i32.store offset=28
    local.get 0
    i64.const 0
    i64.store offset=16
    local.get 0
    i64.const 0
    i64.store offset=4 align=4
    i32.const 0)
  (func (;22;) (type 2) (result i32)
    i32.const 1048)
  (table (;0;) 2 2 funcref)
  (memory (;0;) 256 256)
  (global (;0;) (mut i32) (i32.const 5243936))
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "__indirect_function_table" (table 0))
  (export "_start" (func 3))
  (export "__errno_location" (func 22))
  (export "fflush" (func 20))
  (export "stackSave" (func 8))
  (export "stackRestore" (func 9))
  (export "stackAlloc" (func 10))
  (export "emscripten_stack_init" (func 11))
  (export "emscripten_stack_get_free" (func 12))
  (export "emscripten_stack_get_end" (func 13))
  (elem (;0;) (i32.const 1) func 1)
  (data (;0;) (i32.const 1024) "Hello\00"))
