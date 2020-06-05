class FileObserver2
    #Internal: Initialize the different variables
    def initialize(target_dir)
        @file_inventory = {} #Hash where all the files are stored
        @changed_files = [] #Array with the files that has been changed since the last instance
        @new_files = [] #Array with files that did not exist in the previous instance
        @deleted_files = [] #Array with files that has been removed since the last instance
        @target_dir = target_dir #The specific directory where the program searches for files
    end

  # Internal: Creates a dictionary with all the files, in folders and subfolders.
  #                   Also creates a list with deleted, new, and edited files.
  #
  # target_dir - Directory to find files in
  # files - Array of files in the directory
  # file, mtime - File name and last modified time
  #
  # Examples
  #   update_inventory("/home/user/")
  #   # => {"folder/file.txt", 2020-04-03 14:30:22.446975683 +02:00}
  #
  # Returns the dictionary with file names and modified times
    def update_inventory
        path = File.join( @target_dir, "**/*" )
        files = Dir.glob(path)
        files.each do |file|
            if File.file?( file )
                if @file_inventory.has_key?( file )
                    if mtime != @file_inventory[file]
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
