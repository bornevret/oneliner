class FileObserver2
    
    def initialize(target_dir)
        @file_inventory = {}
        @changed_files = []
        @new_files = []
        @deleted_files = []
        @target_dir = target_dir
    end
    
    def update_inventory
        path = File.join( @target_dir, "**/*" )
        files = Dir.glob(path)
        files.each do |file|
            if File.file?( file )
                if @file_inventory.has_key?( file )
                    if mtime != @file_inventory( file )
                        @changed_files << file
                        @file_inventory = File.mtime(file)
                    end
                else 
                    @file_inventory = File.mtime( file )
                    @new_files << file 
                end
            end
        end
        @file_inventory.each do |file,mtime|
            if not files.include?( file )
                @deleted_files << file
                @file_inventory.delete( file )
            end
        end
    end
        
end
    