
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
        parent.children.delete(self) unless parent.nil?
        @parent = node
        parent.children << self unless parent.nil? || parent.children.include?(self)
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Node is not a child." unless children.include?(child_node)
        child_node.parent = nil
        children.delete(child_node)
    end

    def dfs(target_value)
        #Base case
        return self if self.value == target_value
        #Iterative
        self.children.each do |child|
            return_node = child.dfs(target_value)
            return return_node if !return_node.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target_value
            queue += current_node.children
        end
        nil
    end

end