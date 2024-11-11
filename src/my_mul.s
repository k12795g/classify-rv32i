.globl my_mul

.text
my_mul:
    addi sp, sp, -20
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)

    bge a0, x0, positive_a0
    bge a1, x0, positive_a1
    j no_positive


positive_a0:
    addi s1, a0, 0
    addi s0, a1, 0
    j mul_main

positive_a1:
    addi s1, a1, 0
    addi s0, a0, 0
    j mul_main

no_positive:
    sub s0, x0, a0
    sub s1, x0, a1
    j mul_main

mul_main:
    li s2, 0 # inner loop counter
    li s3, 0 # result

mul_loop:
    # result => s0 * s1 times
    beq s2, s1, mul_loop_end
    add s3, s3, s0
    addi s2, s2, 1
    j mul_loop
mul_loop_end:
    mv a0, s3

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    addi sp, sp, 20

    jr ra