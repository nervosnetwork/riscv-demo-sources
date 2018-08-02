  .global _start
_start:
  call    main
  li a1, 0
  li a2, 0
  li a3, 0
  li a4, 0
  li a5, 0
  li a7, 93
  ecall
