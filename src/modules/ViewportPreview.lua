local ViewPortPreview = {}

ViewPortPreview.New = function(viewportFrame,ItemPart) 
    local WM = Instance.new("WorldModel")
    WM.Parent = viewportFrame

    local part = ItemPart:Clone()
    local primPart = part
    part.Parent = WM
    
    local Size = Vector3.new(2,2,2)

    if (part:IsA("Model")) then
        primPart = ItemPart.PrimaryPart
        primPart.Anchored = true
        part:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0,0,0)))
        Size = part:GetExtentsSize()
    else
        part.Position = Vector3.new(0,0,0) 
        part.Anchored = true
        Size = part.Size
    end 

    part.Parent = viewportFrame
    WM.PrimaryPart = primPart

    local viewportCamera = Instance.new("Camera")
    viewportFrame.CurrentCamera = viewportCamera 
    viewportCamera.CameraType = Enum.CameraType.Scriptable
	--viewportCamera.CFrame = CFrame.new(Vector3.new(Size.X/2,Size.Y*1.1,Size.Z),Vector3.new(0,0,0))  
	viewportCamera.CFrame = CFrame.new(part.PrimaryPart.Position + (part.PrimaryPart.CFrame.LookVector * 5),part.PrimaryPart.Position)
	
    local OUT = {}
    OUT.Remove = function()
        part:Destroy()
        viewportCamera:Destroy()
        viewportFrame:Destroy()
    end

    OUT.CameraPos = function(Vector)
        viewportCamera.CFrame = CFrame.new(Vector,Vector3.new(0,0,0))
    end

    return OUT
end

return ViewPortPreview