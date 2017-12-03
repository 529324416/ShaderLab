Shader "Hidden/Shader/Common/BlendTestOp288"
{
    Properties {
        _DstTex ("DstTex", 2D) ="white"{}
        _SrcTex ("SrcTex", 2D) ="white"{}
    }
    SubShader {
        Pass{
            SetTexture[_DstTex] {combine texture}
        }
        Pass {
            BlendOp Sub
            Blend OneMinusDstColor OneMinusDstColor
            SetTexture [_SrcTex] { combine texture}
        }
    }
}
