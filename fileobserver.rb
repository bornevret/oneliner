class FileObserver
    
    def initialize(target_dir)
        @file_inventory = {}
        @updated_files = []
        @target_dir = target_dir
    end
    
    def getFiles
        @target_dir.gsub!( "\\", "/" )
        path = File.join( @target_dir, "**/*" )
        files = Dir.glob(path)
        puts "path: #{path}"
        files.each do |file|
            begin
                if File.file?( file )
                    file_full_path = File.join( @target_dir )
                    @file_inventory[file_full_path] = File.mtime(file)
                end
            rescue => e
                puts e.message 
            end
        end
    end

    def update_files 
        path = File.join( @target_dir, "**/*" )
        files.each do |file| 
            filetime = File.mtime(file)
            if @file_inventory.has_key?(filetime)         
                    @file_inventory[file] = File.mtime(file)               
                    @updated_files << file
            end
        end 
    end

    def get_new_files
        path = File.join( @target_dir, "**/*" )
        files.each do |file|
            filetime = File.mtime(file)
            if !@file_inventory.include?(file)
                @file_inventory[file] = File.mtime(file)
                @new_files << file
            end
        end
    end

    def get_file_inventory
        files = []
        @file_inventory.each do |file,mtime|
            files << file 
        
        end
        return files
    end
end
