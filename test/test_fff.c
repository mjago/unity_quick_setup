/** \file test_fff.c
 * Test file containing unit tests for fff mocking header
 * \ingroup template
 */

#include "unity.h"
#include <string.h>
#include "fff.h"

DEFINE_FFF_GLOBALS;
FAKE_VOID_FUNC(DISPLAY_init);
FAKE_VOID_FUNC(DISPLAY_output, char *);
FAKE_VALUE_FUNC(unsigned int, DISPLAY_get_line_capacity);
FAKE_VALUE_FUNC(unsigned char, DISPLAY_get_line_insert_index);
FAKE_VALUE_FUNC(double, pow, double, double);

void reset(void)
{
  RESET_FAKE(DISPLAY_init);
  RESET_FAKE(DISPLAY_output);
  RESET_FAKE(DISPLAY_get_line_capacity);
  RESET_FAKE(DISPLAY_get_line_insert_index);
  RESET_FAKE(pow);
}

void test_fff_void_func_no_arguments(void)
{
  DISPLAY_init();
  TEST_ASSERT_EQUAL(1, DISPLAY_init_fake.call_count);
  DISPLAY_init();
  TEST_ASSERT_EQUAL(2, DISPLAY_init_fake.call_count);
  DISPLAY_init();
  TEST_ASSERT_EQUAL(3, DISPLAY_init_fake.call_count);
}

void test_fff_void_func_with_arguments(void)
{
  char msg[] = "helloworld";
  DISPLAY_output(msg);
  TEST_ASSERT_EQUAL(1, DISPLAY_output_fake.call_count);
  TEST_ASSERT_EQUAL(0, strncmp(DISPLAY_output_fake.arg0_val,"helloworld", 10));
}

void test_fff_value_func(void)
{
  DISPLAY_get_line_insert_index_fake.return_val = 12;
  DISPLAY_get_line_insert_index();
  DISPLAY_get_line_insert_index();
  DISPLAY_get_line_insert_index();

  TEST_ASSERT_EQUAL(12, DISPLAY_get_line_insert_index());
  TEST_ASSERT_EQUAL(4, DISPLAY_get_line_insert_index_fake.call_count);
}

// FAKE_VALUE_FUNC(double, pow, double, double);

void test_fff_value_with_args(void)
{
  pow_fake.return_val = 42.5;

  TEST_ASSERT_EQUAL_FLOAT(42.5, pow(1.2, 3.4));
  TEST_ASSERT_EQUAL(1, pow_fake.call_count);
  TEST_ASSERT_EQUAL_FLOAT(1.2, pow_fake.arg0_val);
  TEST_ASSERT_EQUAL_FLOAT(3.4, pow_fake.arg1_val);
}
