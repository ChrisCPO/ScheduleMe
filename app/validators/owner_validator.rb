class OwnerValidator < ActiveModel::Validator
  def validate(record)
    if record.owner?
      record.errors[:owner] << "role can not be changed"
    end
  end
end
