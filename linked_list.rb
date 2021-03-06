class LinkedList

    attr_reader :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(value)
        new_node = Node.new(value, nil)
        if @tail
            @tail.next_node = new_node
        else #first node
            @head = new_node
        end
        @tail = new_node
        @size += 1
    end

    def prepend(value)
        new_node = Node.new(value, nil)
        new_node.next_node = @head
        @tail = new_node unless @tail #first node, so tail not yet defined
        @head = new_node
        @size += 1
    end

    def at(index)

        return "Error: index exceeds size of list" if index >= @size
        
        count = 0
        node = @head
        while count < index do
            node = node.next_node
            count += 1
        end
        
        return node
    end
    
    def pop()
        node = @head
        
        return "Erorr: list is empty" if node.nil?
        
        # only one element in node (head)
        if node.next_node.nil?
           @head = nil
            @tail = nil
            return node
        end
        
        # find second to last node
        while node.next_node.next_node
            puts node.value
            node = node.next_node
        end
        
        @tail = node
        popped_node = node.next_node
        node.next_node = nil
        @size -= 1
        return popped_node
        
    end
    
    def contains?(find_value)
        return false if @head.nil? 
        
        node = @head
        while node
            return true if node.value == find_value
            node = node.next_node
        end

        return false
    end

    def find(find_value)
        return nil if @head.nil? 
        
        node = @head
        count = 0
        while node
            return count if node.value == find_value
            node = node.next_node
            count += 1
        end

        return nil
    end

    def to_s
        output = ""
        node = @head
        while node
            output += "( #{node.value} ) -> "
            node = node.next_node
        end

        output += "nil"

        return output
    end

    def insert_at(data, index)

        return "Error: index exceeds size of list" if index > @size

        if index == 0
            self.prepend(data)
        elsif index == @size
            self.append(data)
        else
            new_node = Node.new(data)
            node = @head
            count = 0
            
            while count < (index - 1)
                node = node.next_node
                count += 1
            end

            next_placeholder = node.next_node
            node.next_node = new_node
            new_node.next_node = next_placeholder
            @size += 1
        end

    end

    def remove_at(index)
        return "Error: index exceeds size of list" if index >= @size

        if index == 0
            @head = @head.next_node
        else
            count = 0
            node = @head
            while count < (index - 1)
                puts index
                node = node.next_node
                count += 1
            end
            node.next_node = node.next_node.next_node
        end
        @size -= 1
    end

end


class Node

    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end

end

# debugging aids

list = LinkedList.new()
list.append('a')
list.append('b')
list.append('c')