module LikesHelper 
    def like_button_text(record)
        liked_class = record.liked_by?(current_user) ? 'liked' : ''
      
        "<div class='flex items-center'>
           <span class='material-symbols-outlined text-gray-600'>
             <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' class='heart-icon #{liked_class}'>
               <path d='M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z' style='fill: #{record.liked_by?(current_user) ? 'red' : 'transparent'}; stroke: #{record.liked_by?(current_user) ? 'transparent' : 'black'}; stroke-width: 2;' />
             </svg>
           </span>
           <span class='mx-3'>#{record.liked_by?(current_user) ? 'Unlike' : 'Like'}</span>
         </div>".html_safe
      end
      
      
end