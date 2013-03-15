require './lib/markdown2code'

describe Markdown2code do
  it "comments normal text" do
    markdown = "This is text"
    Markdown2code.render(markdown).should == "# This is text\n\n"
  end

  it "renders code blocks" do
    markdown = "    echo 'this is code'"
    Markdown2code.render(markdown).should == "echo 'this is code'\n"
  end

  it "renders fenced code blocks" do
    markdown = "```\necho 'this is code'\necho 'another line'\n```"
    Markdown2code.render(markdown).should == "echo 'this is code'\necho 'another line'\n"
  end

  it "renders new lines" do
    markdown = "This is text\nand this is more text\n\n```\necho 'this is code'\n```"
    Markdown2code.render(markdown).should == "# This is text\nand this is more text\n\necho 'this is code'\n"
  end

  it "renders emphasis" do
    markdown = "This is *emphasis* it is"
    Markdown2code.render(markdown).should == "# This is *emphasis* it is\n\n"
  end

  it "renders headers" do
    markdown = "# This is h1"
    Markdown2code.render(markdown).should == "# # This is h1 #\n\n"
  end
end
