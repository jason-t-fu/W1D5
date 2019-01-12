require_relative "PolyTreeNode.rb"

POSSIBLE_MOVES = {
    -2 => [-1, 1],
    -1 => [-2, 2],
    1 => [-2, 2],
    2 => [-1, 1]
}

class KnightPathFinder

    attr_reader :root_node, :considered_positions

    def self.valid_moves(pos)
        valid = []
        
        x, y = pos
        POSSIBLE_MOVES.each do |x_move, poss_y|
            poss_y.each do |y_move|
                if (x + x_move).between?(0,7) && (y + y_move).between?(0,7)
                    valid << [x + x_move, y + y_move]
                end
            end
        end

        valid
    end

    def initialize(pos)
        self.root_node = PolyTreeNode.new(pos)
        self.considered_positions = [root_node.value]
        #build_move_tree
    end

    def build_move_tree

    end

    def find_path

    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.reject! { |move| considered_positions.include?(move) }
        considered_positions.concat(valid_moves)
        valid_moves
    end

end