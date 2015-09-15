/** \file test_file_1.c
 * Test file containing unit tests for file_1.c
 * \ingroup template
 */

#include "file_1.h"
#include "unity.h"

void test_false(void)
{
  TEST_ASSERT_EQUAL(0, false_test());
}
