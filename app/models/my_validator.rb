class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.end_date.to_time.to_i > record.start_date.to_time.to_i
      record.errors[:end_date] << "Impossible de partir avant d'être arriver"
    end
    unless record.place <= record.location.no_of_places
      record.errors[:place] << "Il n'y a pas autant de place ici"
    end
  end
end
