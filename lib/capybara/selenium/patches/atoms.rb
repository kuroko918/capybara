# frozen_string_literal: true

require 'uglifier'

module CapybaraAtoms
private # rubocop:disable Layout/IndentationWidth

  def read_atom(function)
    # @atoms ||= Hash.new { |hash, key|
    #   hash[key] = ::Uglifier.compile(File.read(File.expand_path("../../atoms/#{key}.js", __FILE__)),
    #     compress: {
    #       negate_iife: false
    #     }
    #   )[0...-1]
    # }
    @atoms ||= Hash.new do |hash, key|
      hash[key] = File.read(File.expand_path("../../atoms/#{key}.js", __FILE__))
    end
    @atoms[function]
  end
end

::Selenium::WebDriver::Remote::Bridge.prepend CapybaraAtoms
