class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.end_date.to_time.to_i > record.start_date.to_time.to_i
      record.errors[:end_date] << "La date d'arriver doit etre avant celle de depart"
    end
  end
end
