require 'byebug'

class PolyTreeNode
    
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        # @parent = node #1.parent => nil
        
        #byebug
        prev_parent = parent #nil
        @parent = node #1
        if !parent.nil? && !parent.children.include?(self)
            parent.children << self
        end
        if !prev_parent.nil? && prev_parent != parent
            prev_parent.children.delete(self)
        end
    end

end