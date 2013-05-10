module Refinery
  module Jobs
    module Validators
      class FileSizeValidator < ActiveModel::Validator

        def validate(record)
          file = record.resume

          if file.respond_to?(:length) && file.length > Refinery::Resources.max_file_size
            record.errors[:file] << ::I18n.t('too_big',
                                             :scope => 'activerecord.errors.models.refinery/resource',
                                             :size => Refinery::Resources.max_file_size)
          end
        end

      end
    end
  end
end
