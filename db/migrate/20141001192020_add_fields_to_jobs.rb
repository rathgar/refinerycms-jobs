class AddFieldsToJobs < ActiveRecord::Migration
  def up
    add_column Refinery::Jobs::Job.table_name, :fill, :integer, default: 1
    add_column Refinery::Jobs::Job.table_name, :ref, :string
    add_column Refinery::Jobs::Job.table_name, :education, :string
    add_column Refinery::Jobs::Job.table_name, :experience, :string
    add_column Refinery::Jobs::Job.table_name, :skills, :string
    add_column Refinery::Jobs::Job.table_name, :languages, :string
    add_column Refinery::Jobs::Job.table_name, :salary, :string
    add_column Refinery::Jobs::Job.table_name, :length, :string
    add_column Refinery::Jobs::Job.table_name, :employment_date, :date
    add_column Refinery::Jobs::Job.table_name, :contact, :string

    Refinery::Jobs::Job.add_translation_fields! education: :string
    Refinery::Jobs::Job.add_translation_fields! experience: :string
    Refinery::Jobs::Job.add_translation_fields! skills: :string
    Refinery::Jobs::Job.add_translation_fields! languages: :string
    Refinery::Jobs::Job.add_translation_fields! salary: :string
    Refinery::Jobs::Job.add_translation_fields! length: :string
    Refinery::Jobs::Job.add_translation_fields! contact: :string
  end

  def down
    remove_column :job_translations, :education
    remove_column :job_translations, :experience
    remove_column :job_translations, :skills
    remove_column :job_translations, :languages
    remove_column :job_translations, :salary
    remove_column :job_translations, :length
    remove_column :job_translations, :contact
  end
end
