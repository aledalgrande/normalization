require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'normalization' do
  
  it "should collapse all the double dots with parent directories (1)" do
    "glee/foo/../baz".normalize.should == "glee/baz"
  end
  
  it "should collapse all the double dots with parent directories (2)" do
    "glee/foo/bar/../../baz".normalize.should == "glee/baz"
  end
  
  it "should collapse all the double dots with parent directories (3)" do
    "boo/glee/foo/bar/../../../baz".normalize.should == "boo/baz"
  end
  
  it "should remove single dots" do
    "boo/./foo".normalize.should == "boo/foo"
  end
  
  it "should remove single and double dots (1)" do
    "glee/foo/bar/./../../baz".normalize.should == "glee/baz"
  end
  
  it "should remove single and double dots (2)" do
    "glee/foo/bar/../.././baz".normalize.should == "glee/baz"
  end
  
  it "should not change double slashes" do
    "foo//bar".normalize.should == "foo//bar"
  end
  
  it "should not substitute double dots if at the beginning (1)" do
    "./../foo".normalize.should == "../foo"
  end
  
  it "should not substitute double dots if at the beginning (2)" do
    "./../../foo".normalize.should == "../../foo"
  end
  
end