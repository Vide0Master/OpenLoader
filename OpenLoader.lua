local gpu = component.proxy(component.list("gpu")())
local fss={}

settings={
    boot_file="init.lua"
}

for k,v in component.list("filesystem") do
    fss[#fss+1]=k
end
while true do
    for i=1,#fss do
        local fs=component.proxy(fss[i])
        local files = fs.list("\\")
        for k,v in files do
            local b_file=""
            if v==settings.boot_file then 
                local file = fs.open(v, 'r')
                while true do 
                    local smb=fs.read(file,1)
                    if smb==nil then break else b_file=b_file+smb end
                end
                local exe, err=load(file)
            end
        end
    end
end
