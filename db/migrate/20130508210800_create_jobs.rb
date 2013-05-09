class CreateJobs < ActiveRecord::Migration

  def self.up
    create_table Refinery::Jobs::Job.table_name, :id => true do |t|
      t.string      :title
      t.text        :description
      t.string      :employment_terms
      t.string      :hours
      t.integer     :position
      t.boolean     :enabled
      t.timestamps
    end

    add_index Refinery::Jobs::Job.table_name, :id

    create_table Refinery::Jobs::JobApplication.table_name, :id => true do |t|
      t.string      :job_id
      t.string      :name
      t.string      :phone
      t.string      :email
      t.text        :cover_letter
      t.string      :resume_uid
      t.string      :resume_name
      t.timestamps
    end

    add_index Refinery::Jobs::JobApplication.table_name, :id
    add_index Refinery::Jobs::JobApplication.table_name, :job_id
  end

  def self.down
    Refinery::UserPlugin.destroy_all({:name => "refinerycms_job"})
    Refinery::Page.delete_all({:link_url => "/jobs"})

    drop_table Refinery::Jobs::Job.table_name
    drop_table Refinery::Jobs::JobApplication.table_name
  end

end
