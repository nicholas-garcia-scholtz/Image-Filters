function [] = ApplyFilter(video, filter, varargin)
%ApplyFilter applies the provided filter across all frames
% of a provided video and writes to the current working directory.
%inputs: video, a VideoReader supported video type (.mp4, .avi etc.)
%        filter, function handle of the filter.
%        varargin, optional parameters if required for the filter
%outputs: No output, writes video directly to working directory.
%         WILL OVERWRITE EXISTING FILES OF SAME NAME.
%author: EJV

%Example usage:
%ApplyFilter("videoname.mp4",@Invert)
%ApplyFilter("videoname.mp4",@Blur,9)

%Get the function name string to write in filename.
func_name = functions(filter).function;

%Prepare video for reading and writing.
reader = VideoReader(video);
writer = VideoWriter(sprintf('filtered_video_%s',func_name),'MPEG-4');
open(writer);
frames = read(reader);

%For every video frame, apply the provided filter
for i = 1:size(frames,4)
    frame = frames(:,:,:,i);
    %increase mod value to skip frames
    if mod(i,1)==0
        writer.writeVideo(feval(filter,frame,varargin{1:length(varargin)}));
        clc; %Lazy clear of each render message
        fprintf("Rendered frame %d of %d\n",i,size(frames,4))
    end
end
close(writer);