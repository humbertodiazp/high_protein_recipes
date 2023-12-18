module ApplicationHelper

    def label_class 
        "block text-sm font-medium leading-4 text-gray-900"
    end

    def input_class
        "bg-gray-200 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-orange-600 sm:text-sm "
    end

    def form_button_class 
        "actions flex w-full justify-center rounded-md bg-orange-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-orange-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-orange-600"
    end

    def main_layout
         'flex-grow pt-[60px] md:pt-[0px] md:pl-[240px]' 
    end

    def right_content
         'px-5 my-0 md:my-4' 
    end

    def grid_layout
        'grid-none lg:grid lg:grid-cols-[68%_32%]'
    end

    def include_lists?
    end

    def add_button
        "material-symbols-outlined_add_circle_outline" 
    end

    def border_colors
        { red: 'border-[#ff5769]',
            orange: 'border-[#ff774e]',
            yellow: 'border-[#ffae40]',
            green: 'border-[#68be61]',
            cyan: 'border-[#30cdbf]',
            lightblue: 'border-[#6cb0f3]',
            darkblue: 'border-[#5082e7]',
            purple: 'border-[#7670cc]',
            pink: 'border-[#f57aae]' }
    end

    def bg_colors
    { red: 'bg-[#ff5769]',
        orange: 'bg-[#ff774e]',
        yellow: 'bg-[#ffae40]',
        green: 'bg-[#68be61]',
        cyan: 'bg-[#30cdbf]',
        lightblue: 'bg-[#6cb0f3]',
        darkblue: 'bg-[#5082e7]',
        purple: 'bg-[#7670cc]',
        pink: 'bg-[#f57aae]' }
    end
    
    
end