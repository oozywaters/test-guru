module Admin::GistsHelper
  def gist_hash(url)
    /(?<=com\/).*/.match(url)
  end
end
