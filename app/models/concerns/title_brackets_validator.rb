class TitleBracketsValidator < ActiveModel::Validator

  def validate(record)
    record.errors[:base] << "has invalid title" unless valid_string?(record)
  end

  def valid_string?(record)
    return false if record.title.include?("()"|| "[]" || "{}")
    strim = record.title.gsub(/[^\[\]\(\)\{\}]/,'')
    return true if strim.empty?
    return false if strim.size.odd?
    loop do
      s = strim.gsub('()','').gsub('[]','').gsub('{}','')
      return true if s.empty?
      return false if s == strim
      strim = s
    end
  end
end
