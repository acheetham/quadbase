# Copyright (c) 2011 Rice University.  All rights reserved.

require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "cannot mass-assign comment_thread, creator" do
    ct = Factory.create(:comment_thread)
    u = Factory.create(:user)
    c = Comment.new(:comment_thread => ct, :creator => u)
    assert c.comment_thread != ct
    assert c.creator != u
  end

  test "is_modified" do
    c = Factory.create(:comment)
    assert !c.is_modified?
    c.message = 'Another message'
    c.save!
    assert c.is_modified?
  end

  test "must have comment_thread and creator" do
    ct = Factory.create(:comment_thread)
    u = Factory.create(:user)
    c = Comment.new(:message => "Some message")
    assert !c.save
    c.comment_thread = ct
    assert !c.save
    c.comment_thread = nil
    c.creator = u
    assert !c.save
    c.comment_thread = ct
    c.save!
  end

end