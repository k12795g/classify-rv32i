.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error

    lw t0, 0(a0)

    addi t1, a0, 4
    li t2, 1
    li t4, 0
loop_start:
    beq a1, t2, loop_end
    lw t3, 0(t1)
    ble t3, t0, no_update_max
    addi t0, t3, 0
    addi t4, t2, 0
no_update_max:
    addi t2, t2, 1
    addi t1, t1, 4
    j loop_start


loop_end:
    mv a0, t4
    jr ra
handle_error:
    li a0, 36
    j exit
