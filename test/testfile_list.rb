class TestList

  attr_accessor :test_all, :test_only, :testfile_list, :test_single_file
  def initialize ; @test_all, @test_only, @list = false, false, []

# # # # # # # # # # # # # # #  All / Only   # # # # # # # # # # # # # # # #
#
#    Uncomment all  to test all test files (ignores test specific selection)
#    Uncomment only to test only single_file below

#    all
#    only

  end
  def single_file

# # # # # # # # # # # # # # #  Single File  # # # # # # # # # # # # # # # #
#
#   enter name of single_file to run on setting @test_only flag above
#     ( format dir/testfile_name.c )

    "test/test_file_1.c"

  end
  def list

# # # # # # # # # # # # # # #  Specific Test Files  # # # # # # # # # # # # #
#
#   enter / comment out testfiles to test / ignore...
#     ( format test dir/testfile_name.c )

    test 'test/test_file_1.c'
#   test 'test/test_file_2.c'


# # # # # # # # # # # # # # # # # # # # # # # # # # # ## # # # ## # # # # # #

    @list
  end
  public  def testfile_list ; @test_only ? [single_file] : list end
  private def test(file)    ; @list << file end
  private def only          ; @test_only = true ; end
  private def all           ; @test_all = true  ; end
end
