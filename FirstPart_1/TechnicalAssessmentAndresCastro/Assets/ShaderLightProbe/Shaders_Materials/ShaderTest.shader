Shader "MyShader/Diffuse With LightProbes" {
	Properties{ [NoScaleOffset] _MainTex("Texture", 2D) = "white" {} }
		SubShader{
		Pass {
		Tags {				
				"LightMode" = "ForwardBase"
		}
		CGPROGRAM		
		#pragma vertex v
		#pragma fragment f
		#include "UnityCG.cginc"
		sampler2D _MainTex;	
		
		
		struct v2f {			
			fixed2 uv : TEXCOORD0;
			float4 vertex : SV_POSITION;
			//Create this for storage the ambient uv
			fixed3 ambient : TEXCOORD1;
			fixed3 normal : NORMAL;
		};

		v2f v(appdata_base vertex_data) 
		{
			v2f o;			
			o.vertex = UnityObjectToClipPos(vertex_data.vertex);
			o.uv = vertex_data.texcoord;

			//Add the normal data for calcule the ambient UV
			o.normal = UnityObjectToWorldNormal(vertex_data.normal);
			//Assign the uv data for texture and ambient			
			o.ambient = ShadeSH9(fixed4(o.normal, 1));			
			return o;
		}	

		fixed4 f(v2f input_fragment) : SV_Target{
			fixed4 col = tex2D(_MainTex, input_fragment.uv);
			
			//calcule fixed4 for ambient
			fixed3 ambient = input_fragment.ambient;
			fixed4 result = fixed4(ambient, 1);

			return col * result;
		}
		
		ENDCG
		}
	}
}
