# frozen_string_literal: true
require 'uglifier'

module CapybaraAtoms
  private

  def read_atom(function)
    # @atoms ||= Hash.new { |hash, key|
    #   hash[key] = ::Uglifier.compile(File.read(File.expand_path("../../atoms/#{key}.js", __FILE__)),
    #     compress: {
    #       negate_iife: false
    #     }
    #   )[0...-1]
    # }
    @atoms ||= Hash.new { |hash, key|
      hash[key] = File.read(File.expand_path("../../atoms/#{key}.js", __FILE__))
    }
    @atoms[function]
  end
end

# ::Selenium::WebDriver::Remote::Bridge.prepend CapybaraAtoms