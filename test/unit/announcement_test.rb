# Copyright (c) 2011 Rice University.  All rights reserved.

require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase


  fixtures
  self.use_transactional_fixtures = true

  setup do
    @admin = Factory.build(:user)
    @admin.is_administrator = true
    @admin.save!
  end

  test "must have user" do
    announcement = Announcement.new(:subject => "Some Subject")
    assert !announcement.save
    announcement.user = @admin
    assert announcement.save
  end

  test "must have subject" do
    announcement = Announcement.new
    announcement.user = @admin
    assert !announcement.save
    announcement.subject = "Some Subject"
    assert announcement.save
  end

  test "cannot mass-assign user" do
    announcement = Announcement.new(:subject => "Some Subject", :user => @admin)
    assert !announcement.save
    assert announcement.user != @admin
    announcement.user = @admin
    assert announcement.save
  end
end