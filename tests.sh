#!/bin/bash

# Simple test framework for bash scripts
# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

TESTS_PASSED=0
TESTS_FAILED=0

# Test function
assert_equals () {
      local expected="$1"
      local actual="$2"
      local test_name="$3"

      if [ "$expected" = "$actual" ]; then
          echo -e "${GREEN} v${NC} PASS: $test_name"
          ((TESTS_PASSED++))
      else 
          echo -e "${RED}x${NC} FAIL: $test_name"
          echo " Expected: $expected"
          echo " Got: $actual"
          ((TESTS_FAILED++))
      fi
}

assert_contains () {
      local substring="$1"
      local string="$2"
      local test_name="$3"

      if [[ "$string" == *"$substring"* ]]; then
          echo -e "${GREEN}V${NC} PASS: $test_name"
          ((TESTS_PASSED++))
      else 
          echo -e "${RED}x${NC} FAIL: $test_name"
          echo " Expected '$string' to contain '$substring'"
          ((TESTS_FAILED++))
fi
}

echo "=================================================="
echo "Running Bash Script Tests"
echo "=================================================="

# Test 1: Check if hello.sh exists
if [ -f "hello.sh" ]; then
    echo -e "${GREEN}v${NC} PASS: hello.sh exists"
    ((TESTS_PASSED++))
else
    echo -e "${RED}x${NC} FAIL: hello.sh not found"
    ((TESTS_FAILED++))
fi

# Test 2: Check if hello.sh is executable or can be run with bash
if [ -f "hello.sh" ]; then
    output=$(bash hello.sh 2>&1)
    assert_contains "Hello" "$output" "hello.sh outputs 'Hello'"
fi

# Test 3: Simple math test
result=$((2 + 2))
assert_equals "4" "$result" "Basic math: 2 + 2 = 4"

# Test 4: String manipulation
test_string="Hello World"
assert_contains "World" "$test_string" "String contains 'World'"

# Test 5: File operations
test_file="test_temp.txt"
echo "test content" > "$test_file"
if [ -f "$test_file" ]; then
    echo -e "${GREEN}v${NC} PASS: Can create temporary file"
    ((TESTS_PASSED++))
else
    echo -e "${RED}x${NC} FAIL: Cannot create temporary file"
    ((TESTS_FAILED++))
fi

#Summary
echo "======================================================"
echo "Test Results:"
echo -e "${GREEN}Passed: $TESTS_PASSED${NC}"
echo -e "${RED}Failed: $TESTS_FAILED${NC}"
echo "======================================================"

# Exit with error if any tests failed
if [ $TESTS_FAILED -gt 0 ]; then
    exit 1
else
    exit 0
fi
