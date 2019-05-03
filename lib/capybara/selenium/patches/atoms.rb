# frozen_string_literal: true

module CapybaraAtoms
  private

  def read_atom(function)
    @atoms ||= Hash.new { |hash, key|
      hash[key] = File.read(File.expand_path("../../atoms/#{key}.js", __FILE__))
    }
    @atoms[function]
  end
end

::Selenium::WebDriver::Remote::Bridge.prepend CapybaraAtoms