module ApplicationHelper

    def label_class 
        "block text-sm font-medium leading-4 text-gray-900"
    end

    def input_class
        "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-orange-600 sm:text-sm sm:leading-6"
    end

    def form_button_class 
        "actions flex w-full justify-center rounded-md bg-orange-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-orange-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-orange-600"
    end

    def main_layout
         'pt-[60px] md:pt-[0px] md:pl-[240px]' 
    end

    def right_content
         'px-5 my-0 md:my-4' 
    end

    def grid_layout
        'grid-none lg:grid lg:grid-cols-[68%_32%]'
    end

    def include_lists?
    end

    
end