# $Id: units.rb,v 1.1 2005/03/12 17:02:00 rmagick Exp $
# Copyright (C) 2005 Timothy P. Hunter
class Magick::RVG

    # Define RVG.dpi and RVG.dpi=. Add conversions to Fixnum and Float classes
    class << self
        attr_reader :dpi
        def dpi=(n)
            if !defined?(@dpi)
                [Float, Fixnum].each do |c|
                    c.class_eval do
                        # the default measurement - 1px is 1 pixel
                        def px
                            self
                        end
                        # inches
                        def in
                            self * ::Magick::RVG.dpi
                        end
                        # millimeters
                        def mm
                            self * ::Magick::RVG.dpi / 25.4
                        end
                        # centimeters
                        def cm
                            self * ::Magick::RVG.dpi / 2.54
                        end
                        # points
                        def pt
                            self * ::Magick::RVG.dpi / 72.0
                        end
                        # picas
                        def pc
                            self * ::Magick::RVG.dpi / 6.0
                        end
                        # percentage of the argument
                        def pct(of)
                            self * Float(of) / 100.0
                        end
                        # the default is deg
                        def deg
                            self
                        end
                        # radians -> degrees
                        def rad
                            self * 180.0 / Math::PI
                        end
                        # grads -> degrees
                        def grad
                            self * 9.0 / 10.0
                        end
                    end
                end
            end

            @dpi = Float(n)
            return @dpi
        rescue ArgumentError
            raise TypeError, "Can't convert `#{n}' to Float"
        end
    end     # class << self

end     # class Magick::RVG
