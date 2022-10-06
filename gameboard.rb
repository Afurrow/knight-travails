require_relative 'knight'

class Gameboard 
    def knight_moves(start, dest)
        queue = []
        knight = Knight.new(start)

        until knight.position == dest 
            knight.children.each { |child| queue << child }
            knight = queue.shift
        end 

        lineage = knight.get_lineage()
        puts "It took #{lineage.length - 1} moves to get from #{start} to #{dest}:\n"
        lineage.each { |x| print("#{x.position}\n")}
    end 
end 