class TestList

  attr_accessor :test_all, :test_only, :testfile_list, :test_single_file
  def initialize
    @test_all, @test_only = false, false

#    @test_all = true
#    @test_only = true

  end

  #   #   #   #   #   #   #   #   #   #   #   #   #   #   #
  private

  def list

    @list = []

    test 'test/test_file_1.c'
    test 'test/test_file_2.c'

    @list
  end

  private

  def single_file

    "test/test_file_1.c"

  end

  #   #   #   #   #   #   #   #   #   #   #   #   #   #   #

  private def test(file)
    @list << file
  end

  public

  def testfile_list
    if @test_only
      [ single_file ]
    else
      list
    end
  end

end
