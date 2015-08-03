/** \file test_file_2.c
 * Test file containing unit tests for file_2.c
 * \ingroup template
 */

#include "../dev/unity/src/unity.h"
#include "../src/file_2.c"

void test_FALSE_is_defined(void)
{
  TEST_ASSERT_EQUAL(0, FALSE);
}

void test_not_true(void)
{
  TEST_ASSERT_EQUAL(FALSE, not_true_test());
}

void test_not_0_is_not_false(void)
{
  TEST_ASSERT_EQUAL(! 0, not_test(FALSE));
}

void test_not_1_is_false(void)
{
  TEST_ASSERT_EQUAL(FALSE, not_test(1));
}

void test_not_minus_255_is_false(void)
{
  TEST_ASSERT_EQUAL(FALSE, not_test(-255));
}

