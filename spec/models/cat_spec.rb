require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate that a cat cannot be created without a name" do
    cat = Cat.create(
      age: 9,
      enjoys: 'looking out the window',
      image: 'https://images.unsplash.com/photo-1607374035509-704bee7e1aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhdCUyMGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'
    )
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate that a cat cannot be created without an age" do
    cat = Cat.create(
      name: 'Kev',
      enjoys: 'looking out the window',
      image: 'https://images.unsplash.com/photo-1607374035509-704bee7e1aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhdCUyMGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'
    )
    expect(cat.errors[:age]).to_not be_empty
  end  

  it "should validate that a cat cannot be created without an enjoys" do
    cat = Cat.create(
      name: 'Kev',
      age: 8,
      image: 'https://images.unsplash.com/photo-1607374035509-704bee7e1aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhdCUyMGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate that a cat cannot be created without an image" do
    cat = Cat.create(
      name: 'Kev',
      age: 8,
      enjoys: 'looking out the window',
    )
    expect(cat.errors[:image]).to_not be_empty
  end

  it "should validate that an enjoy entry has a minimum of 10 characters" do
    cat = Cat.create(
      name: 'Kev',
      age: 8,
      enjoys: 'looking',
      image: 'https://images.unsplash.com/photo-1607374035509-704bee7e1aa2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhdCUyMGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end

end
