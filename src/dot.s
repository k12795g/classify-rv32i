.import my_mul.s
.globl dot
.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, error_terminate
    blt a3, t0, error_terminate
    blt a4, t0, error_terminate

    addi sp, sp, -32
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
    sw s5, 24(sp)
    sw s6, 28(sp)


    li s0, 0
    li s1, 0
    addi s2, a0, 0
    addi s3, a1, 0
    addi s4, a2, 0
    addi s5, a3, 0
    addi s6, a4, 0
    slli s5, s5, 2
    slli s6, s6, 2

loop_start:
    bge s1, s4, loop_end
    lw a0, 0(s2)
    lw a1, 0(s3)
    jal my_mul
    add s0, s0, a0

    add s2, s2, s5
    add s3, s3, s6
    addi s1, s1, 1
    j loop_start
loop_end:
    mv a0, s0

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    lw s5, 24(sp)
    lw s6, 28(sp)
    addi sp, sp, 32

    jr ra

error_terminate:
    blt a2, t0, set_error_36
    li a0, 37
    j exit

set_error_36:
    li a0, 36
    j exit
