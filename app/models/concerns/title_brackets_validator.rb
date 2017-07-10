class TitleBracketsValidator < ActiveModel::Validator

  def validate(record)
    re = /(?=\{((?:[^{}]++|\{\g<1>\})++)\})|(?=\[((?:[^]]++|\[\g<1>\])++)\])|(?=\(((?:[^()]++|\(\(\d{4}\)\))++)\))/
    # byebug
    record.errors[:base] << "has invalid title" unless record.title[re] == ""
  end
end
