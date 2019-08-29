class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.end_date.to_time.to_i > record.start_date.to_time.to_i
      record.errors[:end_date] << "La date d'arriver doit etre avant celle de depart"
    end
    unless record.place <= record.location.no_of_places
      record.errors[:place] << "Il n'y a pas autant de place ici"
    end
    unless record.place >= 1
      record.errors[:place] << "doit être superieur à 1"
    end
  end
end
