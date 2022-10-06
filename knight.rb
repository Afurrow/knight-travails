class Knight 
    attr_accessor :moves, :position, :parent, :children    

    @@hist = []

    def initialize(position, parent=nil)
        
        @position = position
        @parent = parent   
        @@hist << position       
    end 

    def moves
        output=[] 
        possible_moves = [[-1, -2], [1, 2], [-1, 2], [1, -2], [-2, -1], [2, 1], [-2, 1], [2, -1]]
        possible_moves.each do |move| 
            x = @position[0] + move[0]
            y = @position[1] + move[1]
            output << [x,y] if x.between?(0,7) && y.between?(0, 7)
        end 
        output
    end

    def children
        children = []
        self.moves.each do |mov|       
            children << Knight.new(mov, self) if @@hist.none?(mov)
        end 
        children
    end 

    def get_lineage(knight=self, lineage=[self])
        until knight.parent.nil? 
            lineage.unshift(knight.parent)
            knight = knight.parent
        end 
        lineage
    end 
end 