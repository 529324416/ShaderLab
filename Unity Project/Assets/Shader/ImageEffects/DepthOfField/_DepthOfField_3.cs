using UnityEngine;
using System.Collections;

public class _DepthOfField_3 : MonoBehaviour {
    public Camera cam;
    public Shader dofShader;
    private Material dofMat = null;
	public Shader blurShader  ;
	private Material blurMat  = null;
    public float focalDist = 10f;
    private float widthOverHeight  = 1.25f;
    private float oneOverBaseSize  = 1.0f / 512.0f;     
	// Use this for initialization
	void Start () {
        blurMat = new Material(blurShader);
        dofMat = new Material(dofShader);
        cam.depthTextureMode = DepthTextureMode.Depth;
	}

    void OnRenderImage (RenderTexture src ,RenderTexture dst ) {
        RenderTexture blurRT = RenderTexture.GetTemporary(src.width, src.height, 16);
        RenderTexture blurRT2 = RenderTexture.GetTemporary(src.width, src.height, 16);

        blurMat.SetVector("offsets", new Vector4(0.0f, 2f * oneOverBaseSize, 0.0f, 0.0f));
        Graphics.Blit(src, blurRT, blurMat);
        blurMat.SetVector("offsets", new Vector4(2f / widthOverHeight * oneOverBaseSize, 0.0f, 0.0f, 0.0f));
        Graphics.Blit(blurRT, blurRT2, blurMat);
        //���ṩ���û��Ļ���Unity��׼��λ�ĵ��ڲ���ת������Z�����ͬ��һ������
        focalDist = Mathf.Clamp(focalDist, cam.nearClipPlane, cam.farClipPlane);
        float fd = focalDist / (cam.farClipPlane - cam.nearClipPlane);
        dofMat.SetTexture("_BlurTex", blurRT2);
        dofMat.SetFloat("dist",fd);
        Graphics.Blit(src, dst, dofMat);

        RenderTexture.ReleaseTemporary(blurRT);
        RenderTexture.ReleaseTemporary(blurRT2);
    }
}
