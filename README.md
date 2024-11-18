# Assignment 2: Classify

## abs.s

### Description

`abs.s` is a function designed to convert an integer to its absolute value. The function modifies the original value through pointer dereferencing.

### Usage

- **Input Parameter**:
  - `a0` (int *): A pointer to the memory address of the integer to be converted.
- **Return Value**:
  - None. The operation directly modifies the value at the pointer's address.

### Detailed Steps

1. Load the integer from the memory address pointed by `a0` into `t0`.
2. If the integer is non-negative, branch to `done`.
3. If the integer is negative, negate it by subtracting it from zero and store the result back to the memory address pointed by `a0`.
4. Return from the function.

### Examples

- Input `-5`, output `5`.
- Input `3`, output `3`.

### Related Code

```assembly
abs:
    lw t0 0(a0)
    bge t0, zero, done
    sub t0, zero, t0
    sw t0 0(a0)
done:
    jr ra
```

## relu.s

### Usage

- **Input Parameter**:
  - `a0`: Pointer to integer array to be modified
  - `a1`: Number of elements in array

- **Return Value**:
  - None - Original array is modified directly

### Detailed Steps

1. Initialize a counter `t1` to 0.
2. Use a loop to iterate through each element of the array:
   - Load the current element into `t2`.
   - If the element is greater than 0, continue to the next element.
   - If the element is 0 or negative, set it to 0.
3. Return from the function.

### Examples

- Input `[-2, 0, 3, -1, 5]`, output `[0, 0, 3, 0, 5]`.

### Related Code

```assembly
relu:
    li t0, 1
    blt a1, t0, error
    li t1, 0
    addi t4, a0, 0
loop_start:
    lw t2, 0(t4)
    bgt t2,x0 ReLUEnd
    addi t2, x0, 0
    sw t2, 0(t4)
ReLUEnd:
    addi t1, t1, 1
    addi t4, t4, 4
    blt t1, a1, loop_start
    jr ra
error:
    li a0, 36
    j exit
```
