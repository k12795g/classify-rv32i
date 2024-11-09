.globl my_mul

.text
my_mul:
    bge a0, x0, postive_a0
    bge a1, x0, postive_a1
    j no_postive


postive_a0:
    addi t1, a0, 0
    addi t0, a1, 0
    j mul_main


postive_a1:
    addi t1, a1, 0
    addi t0, a0, 0
    j mul_main


no_postive:
    sub t0, x0, a0
    sub t1, x0, a1
    j mul_main

mul_main:
    li t2, 0 # inner loop counter
    li t3, 0 # result



mul_loop:
    # result => t0 * t1 times
    add t3, t3, t0
    addi t2, t2, 1
    bne t2, t1, mul_loop
mul_loop_end:
    mv a0, t3
    jr ra