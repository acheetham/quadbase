# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121214001042) do

  create_table "announcements", :force => true do |t|
    t.integer  "user_id"
    t.text     "subject"
    t.text     "body"
    t.boolean  "force"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "announcements", ["user_id"], :name => "index_announcements_on_user_id"

  create_table "answer_choices", :force => true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.decimal  "credit",                      :precision => 16, :scale => 15
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.text     "content_html", :limit => 255
  end

  add_index "answer_choices", ["question_id"], :name => "index_answer_choices_on_question_id"

  create_table "api_keys", :force => true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "assets", :force => true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "uploader_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "assets", ["uploader_id"], :name => "index_assets_on_uploader_id"

  create_table "attachable_assets", :force => true do |t|
    t.integer  "attachable_id"
    t.integer  "asset_id"
    t.string   "local_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "description"
    t.string   "attachable_type"
  end

  add_index "attachable_assets", ["attachable_id", "attachable_type", "local_name"], :name => "index_aa_on_a_id_and_a_type_and_local_name", :unique => true

  create_table "comment_thread_subscriptions", :force => true do |t|
    t.integer  "comment_thread_id"
    t.integer  "user_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "unread_count",      :default => 0
  end

  add_index "comment_thread_subscriptions", ["comment_thread_id", "user_id"], :name => "index_cts_on_ct_id_and_u_id", :unique => true

  create_table "comment_threads", :force => true do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "comment_threads", ["commentable_id", "commentable_type"], :name => "index_comment_threads_on_commentable_id_and_commentable_type"

  create_table "comments", :force => true do |t|
    t.integer  "comment_thread_id"
    t.text     "message"
    t.integer  "creator_id"
    t.boolean  "is_log"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["comment_thread_id"], :name => "index_comments_on_comment_thread_id"
  add_index "comments", ["creator_id"], :name => "index_comments_on_creator_id"

  create_table "deputizations", :force => true do |t|
    t.integer  "deputizer_id"
    t.integer  "deputy_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "deputizations", ["deputizer_id", "deputy_id"], :name => "index_deputizations_on_deputizer_id_and_deputy_id", :unique => true
  add_index "deputizations", ["deputy_id"], :name => "index_deputizations_on_deputy_id"

  create_table "licenses", :force => true do |t|
    t.string   "short_name"
    t.string   "long_name"
    t.string   "url"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "agreement_partial_name"
    t.boolean  "is_default"
  end

  add_index "licenses", ["is_default"], :name => "index_licenses_on_is_default"

  create_table "list_members", :force => true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.boolean  "is_default"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "list_members", ["list_id", "user_id"], :name => "index_project_members_on_project_id_and_user_id", :unique => true
  add_index "list_members", ["user_id", "is_default"], :name => "index_project_members_on_user_id_and_is_default"

  create_table "list_questions", :force => true do |t|
    t.integer  "list_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "list_questions", ["list_id", "question_id"], :name => "index_project_questions_on_project_id_and_question_id", :unique => true
  add_index "list_questions", ["question_id"], :name => "index_project_questions_on_question_id"

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logic_libraries", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.text     "summary"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "always_required"
  end

  add_index "logic_libraries", ["always_required"], :name => "index_logic_libraries_on_always_required"
  add_index "logic_libraries", ["number"], :name => "index_logic_libraries_on_number", :unique => true

  create_table "logic_library_versions", :force => true do |t|
    t.integer  "logic_library_id"
    t.integer  "version"
    t.text     "code"
    t.text     "minified_code"
    t.boolean  "deprecated"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "logic_library_versions", ["deprecated"], :name => "index_logic_library_versions_on_deprecated"
  add_index "logic_library_versions", ["logic_library_id"], :name => "index_logic_library_versions_on_logic_library_id"
  add_index "logic_library_versions", ["version"], :name => "index_logic_library_versions_on_version"

  create_table "logics", :force => true do |t|
    t.text     "code"
    t.string   "variables"
    t.string   "logicable_type"
    t.integer  "logicable_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "cached_code"
    t.string   "variables_array"
    t.string   "required_logic_library_version_ids"
  end

  add_index "logics", ["logicable_id", "logicable_type"], :name => "index_logics_on_logicable_id_and_logicable_type", :unique => true
  add_index "logics", ["required_logic_library_version_ids"], :name => "index_logics_on_required_logic_library_version_ids"

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "oauth_access_grants", :force => true do |t|
    t.integer  "resource_owner_id", :null => false
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.integer  "expires_in",        :null => false
    t.string   "redirect_uri",      :null => false
    t.datetime "created_at",        :null => false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], :name => "index_oauth_access_grants_on_token", :unique => true

  create_table "oauth_access_tokens", :force => true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    :null => false
    t.string   "token",             :null => false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        :null => false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], :name => "index_oauth_access_tokens_on_refresh_token", :unique => true
  add_index "oauth_access_tokens", ["resource_owner_id"], :name => "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], :name => "index_oauth_access_tokens_on_token", :unique => true

  create_table "oauth_applications", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "uid",          :null => false
    t.string   "secret",       :null => false
    t.string   "redirect_uri", :null => false
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], :name => "index_oauth_applications_on_owner_id_and_owner_type"
  add_index "oauth_applications", ["uid"], :name => "index_oauth_applications_on_uid", :unique => true

  create_table "question_collaborators", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "position"
    t.boolean  "is_author",                    :default => false
    t.boolean  "is_copyright_holder",          :default => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.integer  "question_role_requests_count", :default => 0
  end

  add_index "question_collaborators", ["is_author"], :name => "index_question_collaborators_on_is_author"
  add_index "question_collaborators", ["is_copyright_holder"], :name => "index_question_collaborators_on_is_copyright_holder"
  add_index "question_collaborators", ["question_id", "position"], :name => "index_question_collaborators_on_question_id_and_position"
  add_index "question_collaborators", ["user_id", "question_id"], :name => "index_question_collaborators_on_user_id_and_question_id", :unique => true

  create_table "question_dependency_pairs", :force => true do |t|
    t.integer  "independent_question_id"
    t.integer  "dependent_question_id"
    t.string   "kind"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "question_dependency_pairs", ["dependent_question_id"], :name => "index_question_dependency_pairs_on_dependent_question_id"
  add_index "question_dependency_pairs", ["independent_question_id", "dependent_question_id", "kind"], :name => "index_qdp_on_iq_id_and_dq_id_and_kind", :unique => true

  create_table "question_derivations", :force => true do |t|
    t.integer  "derived_question_id"
    t.integer  "source_question_id"
    t.integer  "deriver_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "question_derivations", ["derived_question_id"], :name => "index_question_derivations_on_derived_question_id", :unique => true
  add_index "question_derivations", ["source_question_id"], :name => "index_question_derivations_on_source_question_id"

  create_table "question_parts", :force => true do |t|
    t.integer  "multipart_question_id"
    t.integer  "child_question_id"
    t.integer  "order"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "question_parts", ["child_question_id", "multipart_question_id"], :name => "index_qp_on_cq_id_and_mq_id", :unique => true
  add_index "question_parts", ["multipart_question_id", "order"], :name => "index_question_parts_on_multipart_question_id_and_order"

  create_table "question_role_requests", :force => true do |t|
    t.integer  "question_collaborator_id"
    t.boolean  "toggle_is_author"
    t.boolean  "toggle_is_copyright_holder"
    t.integer  "requestor_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "is_approved",                :default => false
    t.boolean  "is_accepted",                :default => false
  end

  add_index "question_role_requests", ["question_collaborator_id", "toggle_is_author", "toggle_is_copyright_holder"], :name => "index_qrr_on_qc_id_and_t_i_a_and_t_i_ch", :unique => true

  create_table "question_setups", :force => true do |t|
    t.text     "content"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "content_html", :limit => 255
  end

  create_table "questions", :force => true do |t|
    t.integer  "number"
    t.integer  "version"
    t.string   "question_type"
    t.text     "content"
    t.integer  "question_setup_id"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "license_id"
    t.text     "content_html",           :limit => 255
    t.integer  "locked_by",                             :default => -1
    t.datetime "locked_at"
    t.integer  "publisher_id"
    t.boolean  "changes_solution",                      :default => false
    t.text     "code"
    t.string   "variables"
    t.boolean  "answer_can_be_sketched"
  end

  add_index "questions", ["license_id"], :name => "index_questions_on_license_id"
  add_index "questions", ["number", "version"], :name => "index_questions_on_number_and_version"
  add_index "questions", ["question_setup_id"], :name => "index_questions_on_question_setup_id"
  add_index "questions", ["question_type"], :name => "index_questions_on_question_type"
  add_index "questions", ["updated_at"], :name => "index_questions_on_updated_at"
  add_index "questions", ["version"], :name => "index_questions_on_version"

  create_table "solutions", :force => true do |t|
    t.integer  "creator_id"
    t.text     "content"
    t.integer  "question_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "content_html"
    t.text     "explanation"
    t.boolean  "is_visible"
  end

  add_index "solutions", ["creator_id", "is_visible"], :name => "index_solutions_on_creator_id_and_is_visible"
  add_index "solutions", ["question_id"], :name => "index_solutions_on_question_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "list_member_email",     :default => true
    t.boolean  "role_request_email",    :default => true
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.boolean  "announcement_email"
    t.boolean  "auto_author_subscribe", :default => true
  end

  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_administrator",       :default => false
    t.string   "username"
    t.datetime "disabled_at"
    t.integer  "unread_message_count",   :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["disabled_at"], :name => "index_users_on_disabled_at"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["is_administrator"], :name => "index_users_on_is_administrator"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "thumbs_up"
    t.string   "votable_type"
    t.integer  "votable_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["thumbs_up"], :name => "index_votes_on_thumbs_up"
  add_index "votes", ["votable_id", "votable_type", "user_id"], :name => "index_votes_on_votable_id_and_votable_type_and_user_id", :unique => true

  create_table "website_configurations", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "value_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "website_configurations", ["name"], :name => "index_website_configurations_on_name", :unique => true

end
